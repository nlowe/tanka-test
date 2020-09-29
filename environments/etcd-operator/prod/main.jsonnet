local tk = import "tk";

(import "etcd-operator/etcd-operator.libsonnet") + {
    _config+:: {
        namespace: tk.env.spec.namespace
    },
}
