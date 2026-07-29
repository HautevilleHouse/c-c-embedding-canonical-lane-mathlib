import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

/-!
# Interpolation Theorem Package
-/

structure InterpolationTheoremPackage where
  firstSpace : Type u
  secondSpace : Type v
  familyOfOperators : Type w
  realInterpolation : Prop
  complexInterpolation : Prop
  endpointReiteration : Prop

structure InterpolationTheoremEvidence (I : InterpolationTheoremPackage) where
  realInterpolationClosed : I.realInterpolation
  complexInterpolationClosed : I.complexInterpolation
  endpointReiterationClosed : I.endpointReiteration

def InterpolationTheoremClosed (I : InterpolationTheoremPackage) : Prop :=
  I.realInterpolation ∧ I.complexInterpolation ∧ I.endpointReiteration

theorem interpolation_theorem_closed_from_evidence
    (I : InterpolationTheoremPackage) (E : InterpolationTheoremEvidence I) :
    InterpolationTheoremClosed I := by
  exact And.intro E.realInterpolationClosed
    (And.intro E.complexInterpolationClosed E.endpointReiterationClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse