import canonicalLaneMathlib.AdmissibleClass
import CCEmbeddingCanonicalLaneLean.CStarAlgebraPackage

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure HilbertSpace where
  carrier : Type u
  innerProduct : carrier → carrier → ℂ
  completeness : Prop
  completenessTerm : completeness

structure RepresentationPackage (A : CStarAlgebraPackage) where
  hilbertSpace : HilbertSpace
  representation : A.algebra → (hilbertSpace.carrier → ℂ → hilbertSpace.carrier)  -- simplified
  isRepresentation : Prop
  isRepresentationTerm : isRepresentation

structure RepresentationEvidence {A : CStarAlgebraPackage} (R : RepresentationPackage A) where
  isRepresentationClosed : R.isRepresentation

def RepresentationClosed {A : CStarAlgebraPackage} (R : RepresentationPackage A) : Prop :=
  R.isRepresentation

theorem representation_closed_from_evidence {A : CStarAlgebraPackage} (R : RepresentationPackage A) (E : RepresentationEvidence R) :
  RepresentationClosed R := by
  exact E.isRepresentationClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse