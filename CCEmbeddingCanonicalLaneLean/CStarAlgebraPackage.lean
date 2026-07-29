import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CStarAlgebraPackage where
  algebra : Type u
  norm : algebra → ℝ
  star : algebra → algebra
  multiplication : algebra → algebra → algebra
  addition : algebra → algebra → algebra
  zero : algebra
  one : algebra
  CStarIdentity : ∀ x : algebra, ‖star x * x‖ = ‖x‖ ^ 2
  completeness : Prop  -- Every Cauchy sequence converges
  completenessTerm : completeness

structure CStarAlgebraEvidence (A : CStarAlgebraPackage) where
  CStarIdentityClosed : A.CStarIdentity
  completenessClosed : A.completeness

def CStarAlgebraClosed (A : CStarAlgebraPackage) : Prop :=
  A.CStarIdentity ∧ A.completeness

theorem cstar_algebra_closed_from_evidence (A : CStarAlgebraPackage) (E : CStarAlgebraEvidence A) :
  CStarAlgebraClosed A := by
  exact And.intro E.CStarIdentityClosed E.completenessClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse