import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

class NashMoserApproximationPackage where
  smoothingOperator : Type u
  tameEstimate : Prop
  iterationConvergence : Prop
  solutionExistence : Prop

def NashMoserApproximationClosed (N : NashMoserApproximationPackage) : Prop :=
  N.tameEstimate ∧ N.iterationConvergence ∧ N.solutionExistence

class NashMoserApproximationEvidence (N : NashMoserApproximationPackage) where
  tameEstimateClosed : N.tameEstimate
  iterationConvergenceClosed : N.iterationConvergence
  solutionExistenceClosed : N.solutionExistence

theorem nash_moser_approximation_closed_from_evidence (N : NashMoserApproximationPackage) (Ev : NashMoserApproximationEvidence N) :
    NashMoserApproximationClosed N :=
  And.intro Ev.tameEstimateClosed (And.intro Ev.iterationConvergenceClosed Ev.solutionExistenceClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse