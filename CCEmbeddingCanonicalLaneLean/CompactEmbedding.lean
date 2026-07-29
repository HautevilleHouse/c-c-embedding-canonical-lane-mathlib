import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure CompactEmbeddingPackage (E : EmbeddingFunctionSpace) where
  compactDomain : Prop
  hausdorffTarget : Prop
  embeddingIsCompact : Prop
  compactImage : Prop

def CompactEmbeddingPackageEvidence {E : EmbeddingFunctionSpace} (P : CompactEmbeddingPackage E) :=
  { compactDomainClosed : P.compactDomain
    hausdorffTargetClosed : P.hausdorffTarget
    embeddingIsCompactClosed : P.embeddingIsCompact
    compactImageClosed : P.compactImage }

def CompactEmbeddingPackageClosed {E : EmbeddingFunctionSpace} (P : CompactEmbeddingPackage E) : Prop :=
  P.compactDomain ∧ P.hausdorffTarget ∧ P.embeddingIsCompact ∧ P.compactImage

theorem compact_embedding_package_closed_from_evidence {E : EmbeddingFunctionSpace}
    (P : CompactEmbeddingPackage E) (Ev : CompactEmbeddingPackageEvidence P) :
    CompactEmbeddingPackageClosed P := by
  exact And.intro Ev.compactDomainClosed
    (And.intro Ev.hausdorffTargetClosed
      (And.intro Ev.embeddingIsCompactClosed Ev.compactImageClosed))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse