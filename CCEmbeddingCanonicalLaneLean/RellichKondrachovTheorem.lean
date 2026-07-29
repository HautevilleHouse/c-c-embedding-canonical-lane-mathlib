import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure RellichKondrachovPackage where
  domainBounded : Prop
  domainLipschitzBoundary : Prop
  soblevExponent : ℝ
  embeddingIsCompact : Prop

def RellichKondrachovPackageEvidence (P : RellichKondrachovPackage) :=
  { domainBoundedClosed : P.domainBounded
    domainLipschitzBoundaryClosed : P.domainLipschitzBoundary
    embeddingIsCompactClosed : P.embeddingIsCompact }

def RellichKondrachovPackageClosed (P : RellichKondrachovPackage) : Prop :=
  P.domainBounded ∧ P.domainLipschitzBoundary ∧ P.embeddingIsCompact

theorem rellich_kondrachov_package_closed_from_evidence (P : RellichKondrachovPackage)
    (Ev : RellichKondrachovPackageEvidence P) : RellichKondrachovPackageClosed P := by
  exact And.intro Ev.domainBoundedClosed
    (And.intro Ev.domainLipschitzBoundaryClosed Ev.embeddingIsCompactClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse