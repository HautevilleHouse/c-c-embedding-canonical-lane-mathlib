import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

/-!
# Singular Integral Operators Package
-/

structure SingularIntegralOperatorsPackage where
  kernelType : Type u
  principalValue : (kernelType → ℝ) → (ℝ → ℝ)
  smoothCalderonZygmund : Prop
  boundednessOnLp : Prop
  endpointEstimate : Prop

structure SingularIntegralOperatorsEvidence (S : SingularIntegralOperatorsPackage) where
  smoothCalderonZygmundClosed : S.smoothCalderonZygmund
  boundednessOnLpClosed : S.boundednessOnLp
  endpointEstimateClosed : S.endpointEstimate

def SingularIntegralOperatorsClosed (S : SingularIntegralOperatorsPackage) : Prop :=
  S.smoothCalderonZygmund ∧ S.boundednessOnLp ∧ S.endpointEstimate

theorem singular_integral_operators_closed_from_evidence
    (S : SingularIntegralOperatorsPackage) (E : SingularIntegralOperatorsEvidence S) :
    SingularIntegralOperatorsClosed S := by
  exact And.intro E.smoothCalderonZygmundClosed
    (And.intro E.boundednessOnLpClosed E.endpointEstimateClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse