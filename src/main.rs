use clap::Parser;

#[derive(Parser)]
struct Cli {
    #[clap(parse(from_os_str))]
    path: std::path::PathBuf,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args = Cli::parse();
    let content = std::fs::read_to_string(args.path)?;
    println!("{content}");
    Ok(())
}
