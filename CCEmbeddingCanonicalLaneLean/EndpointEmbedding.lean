import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

/-!
# Endpoint Embedding Package
-/

structure EndpointEmbeddingPackage where
  sourceSpace : Type u
  targetSpace : Type v
  embeddingOperator : (sourceSpace → ℝ) → (targetSpace → ℝ)
  weakTypeEndpoint : Prop
  strongTypeEndpoint : Prop
  embeddingClosed : Prop

structure EndpointEmbeddingEvidence (E : EndpointEmbeddingPackage) where
  weakTypeEndpointClosed : E.weakTypeEndpoint
  strongTypeEndpointClosed : E.strongTypeEndpoint
  embeddingClosedTerm : E.embeddingClosed

def EndpointEmbeddingClosed (E : EndpointEmbeddingPackage) : Prop :=
  E.weakTypeEndpoint ∧ E.strongTypeEndpoint ∧ E.embeddingClosed

theorem endpoint_embedding_closed_from_evidence
    (E : EndpointEmbeddingPackage) (Ev : EndpointEmbeddingEvidence E) :
    EndpointEmbeddingClosed E := by
  exact And.intro Ev.weakTypeEndpointClosed
    (And.intro Ev.strongTypeEndpointClosed Ev.embeddingClosedTerm)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse