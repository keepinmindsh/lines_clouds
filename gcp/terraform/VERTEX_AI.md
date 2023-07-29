# Sample 

```terraform 
resource "google_project_service" "notebooks" {
  provider           = google
  service            = "notebooks.googleapis.com"
  disable_on_destroy = false
}

resource "google_notebooks_instance" "basic_instance" {
  project      = "PROJECT_ID"
  name         = "notebooks-instance-basic"
  provider     = google
  location     = "LOCATION"
  machine_type = "e2-medium"

  vm_image {
    project      = "deeplearning-platform-release"
    image_family = "tf-ent-2-9-cu113-notebooks"
  }

  depends_on = [
    google_project_service.notebooks
  ]
}
```

# Tips 

> [https://cloud.google.com/compute/docs/regions-zones?hl=ko&_ga=2.263450308.-998368575.1677453805&_gac=1.40037014.1690435222.EAIaIQobChMIzZOB7JGugAMVhB59Ch1qfQrWEAAYASAAEgJWl_D_BwE](https://cloud.google.com/compute/docs/regions-zones?hl=ko&_ga=2.263450308.-998368575.1677453805&_gac=1.40037014.1690435222.EAIaIQobChMIzZOB7JGugAMVhB59Ch1qfQrWEAAYASAAEgJWl_D_BwE)   
> [https://cloud.google.com/vertex-ai/docs/start/use-terraform-vertex-ai?hl=ko#terraform_resources_vertex_ai](https://cloud.google.com/vertex-ai/docs/start/use-terraform-vertex-ai?hl=ko#terraform_resources_vertex_ai)   
> [https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build?hl=ko](https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build?hl=ko)     
> [https://www.tensorflow.org/tfx/transform/get_started](https://www.tensorflow.org/tfx/transform/get_started)  
   
