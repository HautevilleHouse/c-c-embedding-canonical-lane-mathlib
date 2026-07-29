import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.UltrapowerConstruction
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.II1FactorProperties

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure MicrostateEntropyPackage {A : CStarAlgebraPackage} (U : UltrapowerConstructionPackage A) (II1 : II1FactorPropertiesPackage A) where
  microstatesSpace : Type u
  entropyFunctional : (microstatesSpace) → ℝ
  upperSemicontinuity : Prop
  perturbationStability : Prop
  relationshipToEmbedding : Prop

default

structure MicrostateEntropyEvidence {A : CStarAlgebraPackage} {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A} (M : MicrostateEntropyPackage U II1) where
  upperSemicontinuityClosed : M.upperSemicontinuity
  perturbationStabilityClosed : M.perturbationStability
  relationshipToEmbeddingClosed : M.relationshipToEmbedding

def MicrostateEntropyClosed {A : CStarAlgebraPackage} {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A} (M : MicrostateEntropyPackage U II1) : Prop :=
  M.upperSemicontinuity ∧ M.perturbationStability ∧ M.relationshipToEmbedding

theorem microstate_entropy_closed_from_evidence {A : CStarAlgebraPackage} {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A} (M : MicrostateEntropyPackage U II1) (E : MicrostateEntropyEvidence M) : MicrostateEntropyClosed M :=
  And.intro E.upperSemicontinuityClosed (And.intro E.perturbationStabilityClosed E.relationshipToEmbeddingClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse