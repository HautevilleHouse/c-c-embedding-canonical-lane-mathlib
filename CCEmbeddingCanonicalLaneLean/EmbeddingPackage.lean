import canonicalLaneMathlib.AdmissibleClass
import CCEmbeddingCanonicalLaneLean.CStarAlgebraPackage
import CCEmbeddingCanonicalLaneLean.RepresentationPackage

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingPackage {A : CStarAlgebraPackage} {R : RepresentationPackage A} where
  embedding : A.algebra → (R.hilbertSpace.carrier → ℂ → R.hilbertSpace.carrier) → Prop  -- not exactly, but we keep it abstract
  isInjective : Prop
  isStarPreserving : Prop
  isIsometric : Prop
  embeddingProperties : isInjective ∧ isStarPreserving ∧ isIsometric
  embeddingPropertiesTerm : embeddingProperties

structure EmbeddingEvidence {A : CStarAlgebraPackage} {R : RepresentationPackage A} (E : EmbeddingPackage E) where
  isInjectiveClosed : E.isInjective
  isStarPreservingClosed : E.isStarPreserving
  isIsometricClosed : E.isIsometric

def EmbeddingClosed {A : CStarAlgebraPackage} {R : RepresentationPackage A} (E : EmbeddingPackage E) : Prop :=
  E.isInjective ∧ E.isStarPreserving ∧ E.isIsometric

theorem embedding_closed_from_evidence {A : CStarAlgebraPackage} {R : RepresentationPackage A} (E : EmbeddingPackage E) (Ev : EmbeddingEvidence E) :
  EmbeddingClosed E := by
  exact And.intro Ev.isInjectiveClosed (And.intro Ev.isStarPreservingClosed Ev.isIsometricClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse