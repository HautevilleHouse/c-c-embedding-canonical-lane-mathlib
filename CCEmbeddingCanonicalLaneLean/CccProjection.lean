import CCEmbeddingCanonicalLaneLean.CccAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CccEndgameState where
  object : CccAdmittedObject

structure CccProjection where
  toFun : CccEndgameState → CccEndgameState
  idempotent : ∀ x, toFun (toFun x) = toFun x

def cccProjection : CccProjection := {
  toFun := fun x => x
  idempotent := by intro x; rfl
}

theorem ccc_projection_idempotent (x : CccEndgameState) :
    cccProjection.toFun (cccProjection.toFun x) = cccProjection.toFun x := by
  exact cccProjection.idempotent x

def CccWitnessClosed (O : CccAdmittedObject) : Prop :=
  O.completenessCondition

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse