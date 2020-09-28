// The etcd-operator library doesn't flat-pack its objects which makes it hard to override the namespace
// for this specific set of resources. This will need updated if the etcd-operator library changes.

// TODO: Bringing in the namespace from $._config.etcd_operator_namespace doesn't seem to work

local objs = (import "etcd-operator/etcd-operator.libsonnet") + {
    _config+:: {
        namespace: if std.objectHas($._config, "etcd_operator_namespace") then $._config.etcd_operator_namespace else 'etcd-operator'
    },
};

{
    etcd_operator_deployment: objs.operator_deployment + {
        metadata+: {
            namespace: if std.objectHas($._config, "etcd_operator_namespace") then $._config.etcd_operator_namespace else 'etcd-operator'
        },
    },
} + {
    ["etcd_operator_rbac_%s" % k]: (objs.operator_rbac[k] + {
        metadata+: {
            [if !std.startsWith(self.kind, "Cluster") then "namespace"]: if std.objectHas($._config, "etcd_operator_namespace") then $._config.etcd_operator_namespace else 'etcd-operator'
        },
    })
    for k in std.objectFields(objs.operator_rbac)
}