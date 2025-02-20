# Crear el bucket S3
resource "aws_s3_bucket" "website-practica" {
  bucket = var.bucket_name

   tags = {
    Name        = "${var.bucket_name}-bucket"
    Environment = "dev"
  }
}

# Configuración de bloqueo de acceso público
resource "aws_s3_bucket_public_access_block" "website-practica" {
  bucket                  = aws_s3_bucket.website-practica.id
  block_public_acls       = false  # Permite ACLs públicas en objetos
  block_public_policy     = false  # Permite políticas públicas
  ignore_public_acls      = false  # No ignora ACLs públicas
  restrict_public_buckets = false  # No restringe buckets públicos
}

# Política de acceso público (después de que el bloque de acceso público se aplique correctamente)
resource "aws_s3_bucket_policy" "website-public-access" {
  depends_on = [aws_s3_bucket_public_access_block.website-practica]  # Espera hasta que el bloque de acceso público se haya aplicado
  
  bucket = aws_s3_bucket.website-practica.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicreadGetOject"
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.website-practica.arn}/*"
      }
    ]
  })
}


# Configuración de website para el bucket
resource "aws_s3_bucket_website_configuration" "website-practica" {
  bucket = aws_s3_bucket.website-practica.id

  index_document {
    suffix = "index.html"
  }
}

# Subir el archivo index.html
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.website-practica.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"  # Especificamos el tipo de contenido
}

# Subir el archivo de estilos (style.css)
resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.website-practica.id
  key          = "style.css"
  source       = "./style.css"
  content_type = "text/css"  # Especificamos el tipo de contenido CSS
}

# Subir una página de error (error.html)
resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.website-practica.id
  key          = "error.html"
  source       = "./error.html"
  content_type = "text/html"  # Especificamos que es un archivo HTML
}
