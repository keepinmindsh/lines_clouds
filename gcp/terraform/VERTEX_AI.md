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

   

## Transform 

> [https://www.tensorflow.org/tfx/transform/get_started#setup](https://www.tensorflow.org/tfx/transform/get_started#setup)



# Tips 

> [https://cloud.google.com/compute/docs/regions-zones?hl=ko&_ga=2.263450308.-998368575.1677453805&_gac=1.40037014.1690435222.EAIaIQobChMIzZOB7JGugAMVhB59Ch1qfQrWEAAYASAAEgJWl_D_BwE](https://cloud.google.com/compute/docs/regions-zones?hl=ko&_ga=2.263450308.-998368575.1677453805&_gac=1.40037014.1690435222.EAIaIQobChMIzZOB7JGugAMVhB59Ch1qfQrWEAAYASAAEgJWl_D_BwE)   
> [https://cloud.google.com/vertex-ai/docs/start/use-terraform-vertex-ai?hl=ko#terraform_resources_vertex_ai](https://cloud.google.com/vertex-ai/docs/start/use-terraform-vertex-ai?hl=ko#terraform_resources_vertex_ai)   
> [https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build?hl=ko](https://cloud.google.com/architecture/architecture-for-mlops-using-tfx-kubeflow-pipelines-and-cloud-build?hl=ko)     
> [https://www.tensorflow.org/tfx/transform/get_started](https://www.tensorflow.org/tfx/transform/get_started)  

### Python - numpy install 할 때 체크해야할 사항 

> [https://www.geeksforgeeks.org/how-to-install-numpy-on-macos/](https://www.geeksforgeeks.org/how-to-install-numpy-on-macos/)

```shell
$ pip3 install --upgrade pip

$ pip3 install numpy
```

이게 그래도 안되네..? 아래 항목도 체크중 

- [https://stackoverflow.com/questions/70565965/error-failed-building-wheel-for-numpy-error-could-not-build-wheels-for-numpy](https://stackoverflow.com/questions/70565965/error-failed-building-wheel-for-numpy-error-could-not-build-wheels-for-numpy)
- [https://stackoverflow.com/questions/73453800/can-not-install-async-sqlalchemy-on-mac-fatal-error-python-h-file-not-found](https://stackoverflow.com/questions/73453800/can-not-install-async-sqlalchemy-on-mac-fatal-error-python-h-file-not-found)

2023-07-30 결국 여기서 부터 제대로 안되어서 다시 해야함..;; 

- [https://www.tensorflow.org/tfx/transform/get_started#setup](https://www.tensorflow.org/tfx/transform/get_started#setup)