var materialQuantityCounter = 1;

function addMaterialQuantityForms() {
  materialQuantityCounter++;
  
  var inputMaterial = document.createElement('input');
  inputMaterial.type = 'text';
  inputMaterial.name = 'menu[material][]';
  inputMaterial.id = 'material_' + materialQuantityCounter;
  inputMaterial.placeholder = '材料';

  var inputQuantity = document.createElement('input');
  inputQuantity.type = 'text';
  inputQuantity.name = 'menu[quantity][]';
  inputQuantity.id = 'quantity_' + materialQuantityCounter;
  inputQuantity.placeholder = '分量';

  var buttonDelete = document.createElement('button');
  buttonDelete.type = 'button';
  buttonDelete.id = materialQuantityCounter;
  buttonDelete.onclick = function() { deleteMaterialQuantityForms(this.id); };
  buttonDelete.innerHTML = '削除';

  var formGroup = document.createElement('div');
  formGroup.className = 'form-group';
  formGroup.id = 'material_quantity_formgroup_' + materialQuantityCounter;
  formGroup.appendChild(inputMaterial);
  formGroup.appendChild(inputQuantity);
  formGroup.appendChild(buttonDelete);

  var parent = document.getElementById('material_quantity_form_area');
  parent.appendChild(formGroup);
}

function deleteMaterialQuantityForms(id) {
  var formGroup = document.getElementById('material_quantity_formgroup_' + id);
  formGroup.remove();
}
