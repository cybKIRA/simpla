{* Вкладки *}
{capture name=tabs}
	<li class="active"><a href="index.php?module=CommentsAdmin">Комментарии</a></li>
	{if in_array('feedbacks', $manager->permissions)}<li><a href="index.php?module=FeedbacksAdmin">Обратная связь</a></li>{/if}
{/capture}

{if $delivery->id}
{$meta_title = 'Комментарий от $comment->name' scope=parent}
{else}
{$meta_title = '...' scope=parent}
{/if}

{if $message_success}
<h2 style="color: #459300;">Сохранено!</h2>
{/if}
<!-- Основная форма -->
<form method=post id=product enctype="multipart/form-data">

<input type=hidden name="session_id" value="{$smarty.session.id}">
<input name=id type="hidden" value="{$comment->id}"/> 

	<div id="name">
		<h2>Комментарий</h2>
		<div class="comment_name">{$comment->name|escape}</div>
		<div class="comment_text">{$comment->text|escape|nl2br}</div>
		<div class="checkbox">
			<input name=approved value='1' type="checkbox" id="active_checkbox" {if $comment->approved}checked{/if}/> <label for="active_checkbox">Одобрен</label>
		</div>
	</div> 

	<!-- Описагние товара -->
	<div class="block layer">
		<h2>Редактировать</h2>	
		<textarea name="text" rows="10" style="width: 100%;">{$comment->text|escape|nl2br}</textarea>
	</div>
	<!-- Описание товара (The End)-->
	<input class="button_green button_save" type="submit" name="" value="Сохранить" />
	
</form>
<!-- Основная форма (The End) -->
