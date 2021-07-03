# @kinds apps/DaemonSet apps/Deployment apps/StatefulSet core/Pod

package k8srequiredregistry
violation[{"msg": msg, "details": {"Registry should be": required}}] {
  input.review.object.kind == "Pod"
  some i
  image := input.review.object.spec.containers[i].image
  required := input.object.registry
  not startswith(image,required)
  msg := sprintf("Forbidden registry: %v", [image])
}
