import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CCEmbeddingCanonicalLaneLean.CStarAlgebra

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

structure II1FactorPropertiesPackage (A : CStarAlgebraPackage) where
  trace : A.underlyingSpace → ℂ
  traceProperty : Prop
  factorProperty : Prop
  finiteProperty : Prop
  typeII1 : Prop

default

structure II1FactorPropertiesEvidence {A : CStarAlgebraPackage} (II1 : II1FactorPropertiesPackage A) where
  tracePropertyClosed : II1.traceProperty
  factorPropertyClosed : II1.factorProperty
  finitePropertyClosed : II1.finiteProperty
  typeII1Closed : II1.typeII1

def II1FactorPropertiesClosed {A : CStarAlgebraPackage} (II1 : II1FactorPropertiesPackage A) : Prop :=
  II1.traceProperty ∧ II1.factorProperty ∧ II1.finiteProperty ∧ II1.typeII1

theorem i_i1_factor_properties_closed_from_evidence {A : CStarAlgebraPackage} (II1 : II1FactorPropertiesPackage A) (E : II1FactorPropertiesEvidence II1) : II1FactorPropertiesClosed II1 :=
  And.intro E.tracePropertyClosed (And.intro E.factorPropertyClosed (And.intro E.finitePropertyClosed E.typeII1Closed))

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse