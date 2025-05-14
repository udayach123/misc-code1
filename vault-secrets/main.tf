resource "vault_mount" "kv" {
  for_each    = var.secrets
  path        = each.key
  type        = "kv"
  options     = { version = "2" }
  description = each.value["description"]
}

resource "vault_kv_secret_v2" "values" {
  depends_on = [vault_mount.kv]
  for_each   = var.values
  mount      = each.value["secret"]
  name       = each.key
  data_json  = jsonencode(each.value["value"])
}