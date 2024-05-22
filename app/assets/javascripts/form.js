var i = 2; // 初期のフォームがa1, b1のため、次はa2, b2とする

function addForms() {
    var parent = document.getElementById('form_area');

    // フォームをラップする div を作成
    var formGroup = document.createElement('div');
    formGroup.className = 'form-group';

    // フォームAを追加
    var input_data_a = document.createElement('input');
    input_data_a.type = 'text';
    input_data_a.name = 'menu[material][]'; // 名前を配列形式にする
    input_data_a.id = 'a' + i;
    input_data_a.placeholder = '材料';
    formGroup.appendChild(input_data_a);

    // フォームBを追加
    var input_data_b = document.createElement('input');
    input_data_b.type = 'text';
    input_data_b.name = 'menu[quantity][]'; // 名前を配列形式にする
    input_data_b.id = 'b' + i;
    input_data_b.placeholder = '分量';
    formGroup.appendChild(input_data_b);

    // 削除ボタンを追加（Bフォームの右側）
    var button_data = document.createElement('button');
    button_data.type = 'button'; // type="button" を指定
    button_data.id = i;
    button_data.onclick = function() { deleteForms(this.id); }
    button_data.innerHTML = '×';
    formGroup.appendChild(button_data);

    // formGroup を親要素に追加
    parent.appendChild(formGroup);

    i++;
}

function deleteForms(id) {
    var parent = document.getElementById('form_area');

    // 対象のフォームグループを削除
    var formGroup = document.getElementById('a' + id).parentNode;
    if (formGroup) parent.removeChild(formGroup);
}
