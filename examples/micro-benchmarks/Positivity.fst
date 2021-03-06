module Positivity

open FStar.All

type mlist (a:Type) =
  | MNil : mlist a
  | MCons: a -> nlist a -> mlist a

and nlist (a:Type) =
  | NNil : nlist a
  | NCons: a -> mlist a -> nlist a

(* this is ok since it's an efectful arrow *)
noeq type t1 =
  | C1: (t1 -> ML t1) -> t1

(* checking type abbreviations *)

type t2 (a:Type) = nat -> a

type t3 (a:Type) = nat -> t2 a

noeq type t4 =
  | C4: t3 t4 -> t4
