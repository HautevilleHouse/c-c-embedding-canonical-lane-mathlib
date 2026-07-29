import CCEmbeddingCanonicalLaneLean.CccProjection

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def bridgeClosed (A : CccAdmissibleClass) : Prop :=
  CccWitnessClosed A.object

theorem bridge_from_admissible_class (A : CccAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse