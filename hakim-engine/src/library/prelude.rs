use crate::{app_ref, brain::Term, term, term_ref, TermRef};

pub fn u() -> TermRef {
    term_ref!(universe 0)
}
pub fn u1() -> TermRef {
    term_ref!(universe 1)
}
pub fn u2() -> TermRef {
    term_ref!(universe 2)
}
pub fn u3() -> TermRef {
    term_ref!(universe 3)
}
pub fn z() -> TermRef {
    term_ref!(axiom "ℤ" , u())
}
pub fn false_ty() -> TermRef {
    term_ref!(axiom "False" , u())
}
fn v0() -> TermRef {
    term_ref!(v 0)
}
fn v1() -> TermRef {
    term_ref!(v 1)
}
fn v2() -> TermRef {
    term_ref!(v 2)
}
pub fn eq() -> TermRef {
    term_ref!(axiom "eq" , forall u(), forall v0(), forall v1(), u())
}
pub fn lt() -> TermRef {
    term_ref!(axiom "lt" , forall z(), forall z(), u())
}
pub fn plus() -> TermRef {
    term_ref!(axiom "plus", forall z(), forall z(), z())
}
pub fn mult() -> TermRef {
    term_ref!(axiom "mult", forall z(), forall z(), z())
}
pub fn ex() -> TermRef {
    term_ref!(axiom "ex", forall u(), forall term_ref!(forall v0(), u()), u())
}
pub fn or() -> TermRef {
    term_ref!(axiom "or", forall u(), forall u(), u())
}
pub fn and() -> TermRef {
    term_ref!(axiom "and", forall u(), forall u(), u())
}
pub fn iff() -> TermRef {
    term_ref!(axiom "iff", forall u(), forall u(), u())
}
pub fn set() -> TermRef {
    term_ref!(axiom "set", forall u(), u())
}
//∀ x0: U, (x0 → U) → set x0
pub fn set_from_func() -> TermRef {
    term_ref!(axiom "set_from_func", forall u(),
        forall term_ref!(forall v0(), u()), app_ref!(set(), v1()))
}
pub fn inset() -> TermRef {
    term_ref!(axiom "inset", forall u(), forall v0(), forall app_ref!(set(), v1()), u())
}
pub fn union() -> TermRef {
    term_ref!(axiom "union", forall u(), 
        forall app_ref!(set(), v0()), forall app_ref!(set(), v1()), app_ref!(set(), v2()))
}
pub fn intersection() -> TermRef {
    term_ref!(axiom "intersection", forall u(), 
        forall app_ref!(set(), v0()), forall app_ref!(set(), v1()), app_ref!(set(), v2()))
}
pub fn setminus() -> TermRef {
    term_ref!(axiom "setminus", forall u(), 
        forall app_ref!(set(), v0()), forall app_ref!(set(), v1()), app_ref!(set(), v2()))
}
pub fn included() -> TermRef {
    term_ref!(axiom "included", forall u(), 
        forall app_ref!(set(), v0()), forall app_ref!(set(), v1()), u())
}