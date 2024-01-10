variable "user_group_id" {
    type = string
}

variable "user_ids" {
    type    = list(string)
    default = []
}

variable "tags" {
    type    = map
    default = {}
}
