import canonicalLaneMathlib.AdmissibleClass

/-!
# Abstract Structure Package
-/

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure AbstractStructurePackage (E : CStarAlgebraEmbedding) (P : EmbeddingOperatorPackage E) where
  irreducibleCore : Prop
  vonNeumannAlgebras : Prop
  factorDecomposition : Prop
  cstarEmbeddingLifts : Prop

structure AbstractStructureEvidence (E : CStarAlgebraEmbedding) (P : EmbeddingOperatorPackage E) (A : AbstractStructurePackage E P) where
  irreducibleCoreClosed : A.irreducibleCore
  vonNeumannAlgebrasClosed : A.vonNeumannAlgebras
  factorDecompositionClosed : A.factorDecomposition
  cstarEmbeddingLiftsClosed : A.cstarEmbeddingLifts

def AbstractStructureClosed (E : CStarAlgebraEmbedding) (P : EmbeddingOperatorPackage E) (A : AbstractStructurePackage E P) : Prop :=
  A.irreducibleCore ∧ A.vonNeumannAlgebras ∧ A.factorDecomposition ∧ A.cstarEmbeddingLifts

theorem abstract_structure_closed_from_evidence
    (E : CStarAlgebraEmbedding) (P : EmbeddingOperatorPackage E)
    (A : AbstractStructurePackage E P) (Ev : AbstractStructureEvidence E P A) :
    AbstractStructureClosed E P A := by
  exact And.intro Ev.irreducibleCoreClosed
    (And.intro Ev.vonNeumannAlgebrasClosed
      (And.intro Ev.factorDecompositionClosed Ev.cstarEmbeddingLiftsClosed))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
