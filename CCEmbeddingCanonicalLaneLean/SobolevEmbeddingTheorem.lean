import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure SobolevEmbeddingPackage where
  domainDimension : Nat
  sobolevExponent : ℝ
  embeddingExponent : ℝ
  embeddingInequality : Prop
  continuity : Prop

def SobolevEmbeddingPackageEvidence (P : SobolevEmbeddingPackage) := 
  { embeddingInequalityClosed : P.embeddingInequality
    continuityClosed : P.continuity }

def SobolevEmbeddingPackageClosed (P : SobolevEmbeddingPackage) : Prop :=
  P.embeddingInequality ∧ P.continuity

theorem sobolev_embedding_package_closed_from_evidence (P : SobolevEmbeddingPackage) (E : SobolevEmbeddingPackageEvidence P) :
    SobolevEmbeddingPackageClosed P := by
  exact And.intro E.embeddingInequalityClosed E.continuityClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse