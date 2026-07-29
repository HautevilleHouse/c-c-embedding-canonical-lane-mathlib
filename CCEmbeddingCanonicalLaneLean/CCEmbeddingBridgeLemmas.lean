import CCEmbeddingCanonicalLaneLean.CCEmbeddingAdmissibleClass

namespace HautevilleHouse
namespace CCEmbeddingCanonicalLaneLean

def bridgeClosed (A : CCEmbeddingAdmissibleClass) : Prop :=
  CCEmbeddingWitnessClosed A.object

theorem bridge_from_admissible_class (A : CCEmbeddingAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CCEmbeddingCanonicalLaneLean
end HautevilleHouse
