import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CStarAlgebraPackage where
  underlyingSpace : Type u
  norm : underlyingSpace → ℝ
  multiplication : underlyingSpace → underlyingSpace → underlyingSpace
  involution : underlyingSpace → underlyingSpace
  unit : underlyingSpace
  CStarIdentity : Prop
  completeness : Prop

default

structure CStarAlgebraEvidence (A : CStarAlgebraPackage) where
  CStarIdentityClosed : A.CStarIdentity
  completenessClosed : A.completeness

def CStarAlgebraClosed (A : CStarAlgebraPackage) : Prop :=
  A.CStarIdentity ∧ A.completeness

theorem cstar_algebra_closed_from_evidence (A : CStarAlgebraPackage) (E : CStarAlgebraEvidence A) : CStarAlgebraClosed A :=
  And.intro E.CStarIdentityClosed E.completenessClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse