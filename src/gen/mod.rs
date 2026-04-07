mod basic;
pub use basic::{complete, cycle, grid_2d, path};

#[cfg(feature = "rand")]
mod random;

#[cfg(feature = "rand")]
pub use random::erdos_renyi;
