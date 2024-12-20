use number_prefix::NumberPrefix;
use nvml_wrapper::error::NvmlError;
use nvml_wrapper::Nvml;
use quick_error::quick_error;

use std::io::{self, Write};
use std::thread::sleep;
use std::time::Duration;

/// The time we'll sleep between each iteration of the main loop
const SLEEP_DURATION: Duration = Duration::from_secs(1);

quick_error! {
    /// An error type that wraps around the NVML, and standard library IO types
    #[derive(Debug)]
    pub enum ErrorWrapper {
        Nvidia(err: NvmlError) {
            from()
        }
        Io(err: io::Error) {
            from()
        }
    }
}

fn main() -> Result<(), ErrorWrapper> {
    let nvml = Nvml::init()?;
    let device = nvml.device_by_index(0)?;

    let stdout = io::stdout();
    let mut writer = stdout.lock();

    loop {
        let mem_info = device.memory_info()?;
        let encoder_utilization = device.encoder_utilization()?.utilization;
        let decoder_utilization = device.decoder_utilization()?.utilization;
        let gpu_utilization = device.utilization_rates()?.gpu;

        let used_in_gb = num_bytes_to_string(mem_info.used);
        let total_in_gb = num_bytes_to_string(mem_info.total);

        writeln!(
            &mut writer,
            "{}% ({}%, {}%) {} / {}",
            gpu_utilization, encoder_utilization, decoder_utilization, used_in_gb, total_in_gb
        )?;
        sleep(SLEEP_DURATION);
    }
}

#[inline]
fn num_bytes_to_string(bytes: u64) -> String {
    match NumberPrefix::decimal(bytes as f64) {
        NumberPrefix::Standalone(n) => n.to_string(),
        NumberPrefix::Prefixed(prefix, n) => format!("{:.1} {}B", n, prefix),
    }
}
