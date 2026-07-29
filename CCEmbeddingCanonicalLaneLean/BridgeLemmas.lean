import CCEmbeddingCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CCWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse