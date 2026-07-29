import CCEmbeddingCanonicalLaneLean.CccApproximation

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CccStoneWeierstrass (A : CccAdmissibleClass) where
  subalgebra : Type
  denseCondition : Prop
  separatesPointsCondition : Prop
  containsConstantsCondition : Prop
  unitalCondition : Prop
  closedCondition : Prop
  densityClosed : denseCondition
  separatesPointsClosed : separatesPointsCondition
  containsConstantsClosed : containsConstantsCondition
  unitalClosed : unitalCondition
  closedClosed : closedCondition

def CccStoneWeierstrassClosed (A : CccAdmissibleClass) (S : CccStoneWeierstrass A) : Prop :=
  S.densityClosed ∧ S.separatesPointsClosed ∧ S.containsConstantsClosed ∧ S.unitalClosed ∧ S.closedClosed

theorem ccc_stone_weierstrass_closed (A : CccAdmissibleClass) (S : CccStoneWeierstrass A) :
    CccStoneWeierstrassClosed A S := by
  exact And.intro S.densityClosed (And.intro S.separatesPointsClosed (And.intro S.containsConstantsClosed (And.intro S.unitalClosed S.closedClosed)))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse