function addMakeStep() {
  var stepCount = document.querySelectorAll('textarea[name^="menu[make]"]').length + 1;
  
  var textareaStep = document.createElement('textarea');
  textareaStep.name = 'menu[make][]';
  textareaStep.id = 'make_step_' + stepCount;
  textareaStep.className = 'form-control';
  textareaStep.rows = 8;
  textareaStep.placeholder = 'ステップ' + stepCount + 'の作り方を入力してください';

  var buttonDelete = document.createElement('button');
  buttonDelete.type = 'button';
  buttonDelete.onclick = function() { deleteMakeStep(stepCount); };
  buttonDelete.innerHTML = '×';

  var labelStep = document.createElement('label');
  labelStep.innerHTML = 'ステップ' + stepCount;

  var formGroup = document.createElement('div');
  formGroup.className = 'form-group';
  formGroup.id = 'make_formgroup_' + stepCount;
  formGroup.appendChild(labelStep);
  formGroup.appendChild(textareaStep);
  formGroup.appendChild(buttonDelete);

  var parent = document.getElementById('make_form_area');
  parent.appendChild(formGroup);
}

function deleteMakeStep(stepCount) {
  var formGroup = document.getElementById('make_formgroup_' + stepCount);
  formGroup.remove();
}
