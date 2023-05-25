document.addEventListener('DOMContentLoaded', function() {
  // 新規投稿・編集ページのフォームを取得
  const ImageList = document.getElementById('image-list');
  // プレビューを表示するためのスペースを取得
  const previewList = document.getElementById('previews');
  // 新規投稿・編集ページのフォームがないならここで終了。「!」は論理否定演算子。
  if (!ImageList) return null;

  // input要素を取得
  const fileField = document.querySelector('input[type="file"][name="item[image]"]');
  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
    // 古いプレビューが存在する場合は削除
    const alreadyPreview = document.querySelector('.preview');
    if (alreadyPreview) {
      alreadyPreview.remove();
    };
    const file = e.target.files[0];
    const blob = window.URL.createObjectURL(file);
    // 画像を表示するためのdiv要素を生成
    const previewWrapper = document.createElement('div');
    previewWrapper.setAttribute('class', 'preview');
    // 表示する画像を生成
    const previewImage = document.createElement('img');
    previewImage.setAttribute('class', 'preview-image');
    previewImage.setAttribute('src', blob);
    // 画像のサイズを指定
    const desiredWidth = 300; // 縮小後の幅
    const desiredHeight = 200; // 縮小後の高さ
    previewImage.style.width = desiredWidth + 'px';
    previewImage.style.height = desiredHeight + 'px';
    // 生成したHTMLの要素をブラウザに表示させる
    previewWrapper.appendChild(previewImage);
    previewList.appendChild(previewWrapper);
  });
});
