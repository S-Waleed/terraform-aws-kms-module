variable description {}

# Options available
# SYMMETRIC_DEFAULT, RSA_2048, RSA_3072,
# RSA_4096, ECC_NIST_P256, ECC_NIST_P384,
# ECC_NIST_P521, or ECC_SECG_P256K1
variable key_spec {
  default = "SYMMETRIC_DEFAULT"
}

variable enabled {
  default = true
}

variable rotation_enabled {
  default = true
}

variable tags {}

variable alias {}

variable policy {}
