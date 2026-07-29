import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

class EmbeddingOperatorPackage where
  sourceSpace : Type u
  targetSpace : Type v
  embeddingMap : sourceSpace → targetSpace
  injectivity : Prop
  continuity : Prop
  openMap : Prop

def EmbeddingOperatorClosed (E : EmbeddingOperatorPackage) : Prop :=
  E.injectivity ∧ E.continuity ∧ E.openMap

class EmbeddingOperatorEvidence (E : EmbeddingOperatorPackage) where
  injectivityClosed : E.injectivity
  continuityClosed : E.continuity
  openMapClosed : E.openMap

theorem embedding_operator_closed_from_evidence (E : EmbeddingOperatorPackage) (Ev : EmbeddingOperatorEvidence E) :
    EmbeddingOperatorClosed E :=
  And.intro Ev.injectivityClosed (And.intro Ev.continuityClosed Ev.openMapClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse