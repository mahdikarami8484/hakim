#![allow(clippy::enum_variant_names)]

pub mod brain;
pub mod engine;
pub mod interactive;
mod library;
pub mod parser;
pub use brain::{Abstraction, Term, TermRef};
