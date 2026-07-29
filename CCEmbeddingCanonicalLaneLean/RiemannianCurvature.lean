import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

class RiemannianCurvaturePackage where
  manifold : Type u
  metric : Type v
  riemannCurvatureTensor : Type w
  ricciTensor : Type x
  scalarCurvature : Type y
  smoothThreeManifold : Prop
  metricSmooth : Prop
  riemannTensorLawful : Prop
  ricciTensorContractedFromRiemann : Prop
  scalarCurvatureTraceOfRicci : Prop

class RiemannianCurvatureEvidence (G : RiemannianCurvaturePackage) where
  smoothThreeManifoldClosed : G.smoothThreeManifold
  metricSmoothClosed : G.metricSmooth
  riemannTensorLawfulClosed : G.riemannTensorLawful
  ricciTensorContractedFromRiemannClosed : G.ricciTensorContractedFromRiemann
  scalarCurvatureTraceOfRicciClosed : G.scalarCurvatureTraceOfRicci

def RiemannianCurvatureClosed (G : RiemannianCurvaturePackage) : Prop :=
  G.smoothThreeManifold ∧ G.metricSmooth ∧ G.riemannTensorLawful ∧ G.ricciTensorContractedFromRiemann ∧ G.scalarCurvatureTraceOfRicci

theorem riemannian_curvature_closed_from_evidence (G : RiemannianCurvaturePackage) (E : RiemannianCurvatureEvidence G) :
    RiemannianCurvatureClosed G :=
  And.intro E.smoothThreeManifoldClosed (And.intro E.metricSmoothClosed (And.intro E.riemannTensorLawfulClosed (And.intro E.ricciTensorContractedFromRiemannClosed E.scalarCurvatureTraceOfRicciClosed)))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse