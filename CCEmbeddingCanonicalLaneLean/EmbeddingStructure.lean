import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.CStarAlgebra

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingStructurePackage (A : CStarAlgebraPackage) where
  domain : Type u
  codomain : Type v
  embeddingMap : domain → codomain
  homomorphismProperty : Prop
  isometric : Prop
  multiplicative : Prop
  involutive : Prop

default

structure EmbeddingStructureEvidence {A : CStarAlgebraPackage} (E : EmbeddingStructurePackage A) where
  homomorphismPropertyClosed : E.homomorphismProperty
  isometricClosed : E.isometric
  multiplicativeClosed : E.multiplicative
  involutiveClosed : E.involutive

def EmbeddingStructureClosed {A : CStarAlgebraPackage} (E : EmbeddingStructurePackage A) : Prop :=
  E.homomorphismProperty ∧ E.isometric ∧ E.multiplicative ∧ E.involutive

theorem embedding_structure_closed_from_evidence {A : CStarAlgebraPackage} (E : EmbeddingStructurePackage A) (Ev : EmbeddingStructureEvidence E) : EmbeddingStructureClosed E :=
  And.intro Ev.homomorphismPropertyClosed (And.intro Ev.isometricClosed (And.intro Ev.multiplicativeClosed Ev.involutiveClosed))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse