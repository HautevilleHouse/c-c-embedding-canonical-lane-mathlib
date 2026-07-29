import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

/-!
# BMO Space Theory Package
-/

structure BMOTheoryPackage where
  bmoSpace : Type u
  normDefinition : (bmoSpace → ℝ) → ℝ
  feffermanSteinDuality : Prop
  johnNirenbergInequality : Prop
  embeddingToExponential : Prop

structure BMOTheoryEvidence (B : BMOTheoryPackage) where
  feffermanSteinDualityClosed : B.feffermanSteinDuality
  johnNirenbergInequalityClosed : B.johnNirenbergInequality
  embeddingToExponentialClosed : B.embeddingToExponential

def BMOTheoryClosed (B : BMOTheoryPackage) : Prop :=
  B.feffermanSteinDuality ∧ B.johnNirenbergInequality ∧ B.embeddingToExponential

theorem bmo_theory_closed_from_evidence
    (B : BMOTheoryPackage) (E : BMOTheoryEvidence B) :
    BMOTheoryClosed B := by
  exact And.intro E.feffermanSteinDualityClosed
    (And.intro E.johnNirenbergInequalityClosed E.embeddingToExponentialClosed)

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse