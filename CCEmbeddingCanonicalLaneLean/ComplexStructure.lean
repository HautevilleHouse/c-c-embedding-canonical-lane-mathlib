import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

class ComplexStructurePackage where
  baseManifold : Type u
  almostComplexStructure : Type v
  integrability : Prop
  newlanderNirenberg : Prop

def ComplexStructureClosed (C : ComplexStructurePackage) : Prop :=
  C.integrability ∧ C.newlanderNirenberg

class ComplexStructureEvidence (C : ComplexStructurePackage) where
  integrabilityClosed : C.integrability
  newlanderNirenbergClosed : C.newlanderNirenberg

theorem complex_structure_closed_from_evidence (C : ComplexStructurePackage) (Ev : ComplexStructureEvidence C) :
    ComplexStructureClosed C :=
  And.intro Ev.integrabilityClosed Ev.newlanderNirenbergClosed

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse