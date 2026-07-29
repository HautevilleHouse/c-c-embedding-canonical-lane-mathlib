import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.CStarAlgebra

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure UltrapowerConstructionPackage (A : CStarAlgebraPackage) where
  indexSet : Type u
  ultrafilter : (Set indexSet) → Prop
  reducedProduct : Type v
  norm : reducedProduct → ℝ
  multiplication : reducedProduct → reducedProduct → reducedProduct
  involution : reducedProduct → reducedProduct
  CStarProperty : Prop
  completeness : Prop

default

structure UltrapowerConstructionEvidence {A : CStarAlgebraPackage} (U : UltrapowerConstructionPackage A) where
  CStarPropertyClosed : U.CStarProperty
  completenessClosed : U.completeness

def UltrapowerConstructionClosed {A : CStarAlgebraPackage} (U : UltrapowerConstructionPackage A) : Prop :=
  U.CStarProperty ∧ U.completeness

theorem ultrapower_construction_closed_from_evidence {A : CStarAlgebraPackage} (U : UltrapowerConstructionPackage A) (E : UltrapowerConstructionEvidence U) : UltrapowerConstructionClosed U :=
  And.intro E.CStarPropertyClosed E.completenessClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse