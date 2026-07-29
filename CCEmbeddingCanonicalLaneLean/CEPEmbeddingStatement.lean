import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.MicrostateEntropy
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.EmbeddingStructure

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CEPEmbeddingStatementPackage {A : CStarAlgebraPackage}
    {E : EmbeddingStructurePackage A}
    {U : UltrapowerConstructionPackage A}
    {II1 : II1FactorPropertiesPackage A}
    (M : MicrostateEntropyPackage U II1) where
  hyperfiniteII1Factor : CStarAlgebraPackage
  embeddingExists : Prop
  ceqStatement : Prop
  microstateCriterion : Prop
  embeddingFromMicrostates : embeddingExists → microstateCriterion

default

structure CEPEmbeddingStatementEvidence {A : CStarAlgebraPackage} {E : EmbeddingStructurePackage A}
    {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A}
    {M : MicrostateEntropyPackage U II1} (CEP : CEPEmbeddingStatementPackage M) where
  ceqStatementClosed : CEP.ceqStatement
  microstateCriterionClosed : CEP.microstateCriterion

def CEPEmbeddingStatementClosed {A : CStarAlgebraPackage} {E : EmbeddingStructurePackage A}
    {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A}
    {M : MicrostateEntropyPackage U II1} (CEP : CEPEmbeddingStatementPackage M) : Prop :=
  CEP.ceqStatement ∧ CEP.microstateCriterion

theorem cep_embedding_statement_closed_from_evidence {A : CStarAlgebraPackage} {E : EmbeddingStructurePackage A}
    {U : UltrapowerConstructionPackage A} {II1 : II1FactorPropertiesPackage A}
    {M : MicrostateEntropyPackage U II1} (CEP : CEPEmbeddingStatementPackage M) (Ev : CEPEmbeddingStatementEvidence CEP) : CEPEmbeddingStatementClosed CEP :=
  And.intro Ev.ceqStatementClosed Ev.microstateCriterionClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse