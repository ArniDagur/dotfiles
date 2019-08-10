#[macro_use]
extern crate quick_error;
extern crate battery;

use std::env;
use std::io::{self, Write};
use std::process::exit;
use std::thread::sleep;
use std::time::Duration;

use battery::units::ratio::percent;
use battery::Manager as BatteryManager;
use battery::State;

/// The time we'll sleep between each iteration of the main loop
const SLEEP_DURATION: Duration = Duration::from_secs(5);

const BATTERY_FULL: char = '';
const BATTERY_75: char = '';
const BATTERY_50: char = '';
const BATTERY_25: char = '';
const BATTERY_EMPTY: char = '';
const QUESTION: char = '';
const LIGHTNING: char = '';

quick_error! {
    /// An error type that wraps around the Battery and std::io error types
    #[derive(Debug)]
    pub enum ErrorWrapper {
        Battery(err: battery::Error) {
            from()
        }
        Io(err: io::Error) {
            from()
        }
    }
}

fn main() -> Result<(), ErrorWrapper> {
    let manager = BatteryManager::new()?;
    let mut batteries = manager.batteries()?;

    if is_check_flag() {
        exit(if batteries.count() == 0 { 1 } else { 0 })
    }

    let mut battery = batteries
        .next()
        .expect("No batteries found")
        .expect("Unable to acecess battery information");

    let stdout = io::stdout();
    let mut writer = stdout.lock();

    loop {
        let state = battery.state();
        let charge_level = battery.state_of_charge().get::<percent>();

        let state_icon = get_state_icon(&state);
        let battery_icon = get_battery_icon(charge_level);

        match state_icon {
            Some(i) => writeln!(&mut writer, "{} {} {:.0}%", i, battery_icon, charge_level)?,
            None => writeln!(&mut writer, "{} {:.0}%", battery_icon, charge_level)?,
        }

        sleep(SLEEP_DURATION);
        manager.refresh(&mut battery)?;
    }
}

fn is_check_flag() -> bool {
    let args: Vec<String> = env::args().collect();
    args.contains(&"--check".to_string())
}

/// Get the icon representation of the given charging state
#[inline]
fn get_state_icon(state: &State) -> Option<char> {
    match state {
        State::Unknown => Some(QUESTION),
        State::Charging => Some(LIGHTNING),
        _ => None,
    }
}

/// Get the icon representation of the given battery charge
#[inline]
fn get_battery_icon(charge_level: f32) -> char {
    if charge_level < 12.5 {
        BATTERY_EMPTY
    } else if charge_level < 37.5 {
        BATTERY_25
    } else if charge_level < 62.5 {
        BATTERY_50
    } else if charge_level < 87.5 {
        BATTERY_75
    } else {
        BATTERY_FULL
    }
}
