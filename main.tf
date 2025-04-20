# main.tf

provider "local" {
  # No config needed
}

resource "null_resource" "deploy_static_site" {
  provisioner "local-exec" {
    command = <<EOT
      if exist "C:\\nginx\\html\\stellartrack" rmdir /S /Q "C:\\nginx\\html\\stellartrack"
      xcopy /E /I /Y "${path.module}/site" "C:\\nginx\\html\\stellartrack"
    EOT
  }
}
