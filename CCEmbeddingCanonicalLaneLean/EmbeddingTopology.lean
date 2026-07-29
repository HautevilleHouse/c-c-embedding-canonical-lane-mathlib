import CCEmbeddingCanonicalLaneLean.EmbeddingFunctionSpace

/-!
# Embedding Topology Package
-/

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure EmbeddingTopologyPackage {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    (P : EmbeddingFunctionSpacePackage X Y) where
  compactOpenTopology : TopologicalSpace P.continuousMaps
  embeddingTopology : TopologicalSpace P.continuousMaps
  topologyCompatibility : compactOpenTopology = embeddingTopology
  fineTopologyDefined : Prop
  fineTopologyCompatible : Prop

structure EmbeddingTopologyEvidence {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (T : EmbeddingTopologyPackage P) where
  topologyCompatibilityClosed : T.topologyCompatibility
  fineTopologyDefinedClosed : T.fineTopologyDefined
  fineTopologyCompatibleClosed : T.fineTopologyCompatible

def EmbeddingTopologyClosed {X Y : Type u}
    [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (T : EmbeddingTopologyPackage P) : Prop :=
  T.topologyCompatibility ∧ T.fineTopologyDefined ∧ T.fineTopologyCompatible

theorem embedding_topology_closed_from_evidence
    {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    {P : EmbeddingFunctionSpacePackage X Y}
    (T : EmbeddingTopologyPackage P)
    (E : EmbeddingTopologyEvidence T) :
    EmbeddingTopologyClosed T := by
  exact And.intro E.topologyCompatibilityClosed
    (And.intro E.fineTopologyDefinedClosed E.fineTopologyCompatibleClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse