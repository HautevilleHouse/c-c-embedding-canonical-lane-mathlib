import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure WhitneyEmbeddingPackage (M : Type u) [TopologicalSpace M] where
  smoothStructure : Prop
  dimensionM : Nat
  embeddingDimension : Nat
  embeddingExists : Prop
  properEmbedding : Prop

def WhitneyEmbeddingPackageEvidence {M : Type u} [TopologicalSpace M] (P : WhitneyEmbeddingPackage M) :=
  { smoothStructureClosed : P.smoothStructure
    embeddingExistsClosed : P.embeddingExists
    properEmbeddingClosed : P.properEmbedding }

def WhitneyEmbeddingPackageClosed {M : Type u} [TopologicalSpace M] (P : WhitneyEmbeddingPackage M) : Prop :=
  P.smoothStructure ∧ P.embeddingExists ∧ P.properEmbedding

theorem whitney_embedding_package_closed_from_evidence {M : Type u} [TopologicalSpace M]
    (P : WhitneyEmbeddingPackage M) (Ev : WhitneyEmbeddingPackageEvidence P) :
    WhitneyEmbeddingPackageClosed P := by
  exact And.intro Ev.smoothStructureClosed
    (And.intro Ev.embeddingExistsClosed Ev.properEmbeddingClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse