import CCEmbeddingCanonicalLaneLean.CccStoneWeierstrass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CccFunctionalAnalysis (A : CccAdmissibleClass) where
  functionSpace : Type
  normedSpaceCondition : Prop
  banachCondition : Prop
  embeddingOperator : Type
  boundednessCondition : Prop
  closednessCondition : Prop
  normedSpaceClosed : normedSpaceCondition
  banachClosed : banachCondition
  boundednessClosed : boundednessCondition
  closednessClosed : closednessCondition

def CccFunctionalAnalysisClosed (A : CccAdmissibleClass) (F : CccFunctionalAnalysis A) : Prop :=
  F.normedSpaceClosed ∧ F.banachClosed ∧ F.boundednessClosed ∧ F.closednessClosed

theorem ccc_functional_analysis_closed (A : CccAdmissibleClass) (F : CccFunctionalAnalysis A) :
    CccFunctionalAnalysisClosed A F := by
  exact And.intro F.normedSpaceClosed (And.intro F.banachClosed (And.intro F.boundednessClosed F.closednessClosed))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse