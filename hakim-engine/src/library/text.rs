pub fn load_text(name: &str) -> Option<&str> {
    Some(match name {
        "Arith" => include_str!("Arith.v"),
        "Logic" => include_str!("Logic.v"),
        "Eq" => include_str!("Eq.v"),
        "Sigma" => include_str!("Sigma.v"),
        "Induction" => include_str!("Induction.v"),
        "Set" => include_str!("Set.v"),
        _ => return None,
    })
}
