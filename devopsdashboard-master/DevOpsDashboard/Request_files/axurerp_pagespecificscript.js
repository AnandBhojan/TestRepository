for(var i = 0; i < 56; i++) { var scriptId = 'u' + i; window[scriptId] = document.getElementById(scriptId); }

$axure.eventManager.pageLoad(
function (e) {

if (true) {

SetSelectedOption('u51', GetGlobalVariableValue('projname'));

SetWidgetFormText('u42', GetGlobalVariableValue('NoVDI'));

}

});
gv_vAlignTable['u36'] = 'top';
$axure.eventManager.mouseover('u16', function(e) {
if (!IsTrueMouseOver('u16',e)) return;
if (true) {

	SetPanelVisibility('u4','hidden','none',500);

}
});

$axure.eventManager.mouseover('u17', function(e) {
if (!IsTrueMouseOver('u17',e)) return;
if (true) {

	SetPanelVisibility('u4','','none',500);

	BringToFront("u4");

}
});
gv_vAlignTable['u29'] = 'top';gv_vAlignTable['u8'] = 'center';gv_vAlignTable['u30'] = 'top';gv_vAlignTable['u21'] = 'top';gv_vAlignTable['u6'] = 'center';gv_vAlignTable['u32'] = 'top';
$axure.eventManager.mouseover('u15', function(e) {
if (!IsTrueMouseOver('u15',e)) return;
if (true) {

	SetPanelVisibility('u4','hidden','none',500);

}
});

$axure.eventManager.mouseover('u13', function(e) {
if (!IsTrueMouseOver('u13',e)) return;
if (true) {

	SetPanelVisibility('u4','hidden','none',500);

}
});

$axure.eventManager.mouseover('u14', function(e) {
if (!IsTrueMouseOver('u14',e)) return;
if (true) {

	SetPanelVisibility('u4','hidden','none',500);

}
});
gv_vAlignTable['u38'] = 'top';gv_vAlignTable['u43'] = 'top';gv_vAlignTable['u40'] = 'top';gv_vAlignTable['u1'] = 'center';gv_vAlignTable['u41'] = 'top';gv_vAlignTable['u10'] = 'top';gv_vAlignTable['u11'] = 'top';gv_vAlignTable['u3'] = 'center';gv_vAlignTable['u12'] = 'top';u9.tabIndex = 0;

u9.style.cursor = 'pointer';
$axure.eventManager.click('u9', function(e) {

if (true) {

    self.location.href="resources/reload.html#" + encodeURI($axure.globalVariableProvider.getLinkUrl($axure.pageData.url));

}
});
gv_vAlignTable['u9'] = 'top';gv_vAlignTable['u27'] = 'top';
u23.style.cursor = 'pointer';
$axure.eventManager.click('u23', function(e) {

if (true) {

SetGlobalVariableValue('projname', GetSelectedOption('u51'));

SetGlobalVariableValue('NoVDI', GetWidgetText('u42'));

SetGlobalVariableValue('SeedFile', GetSelectedOption('u44'));

SetGlobalVariableValue('Intergraph', GetSelectedOption('u48'));

SetGlobalVariableValue('VDIAdmin', GetSelectedOption('u50'));

	self.location.href=$axure.globalVariableProvider.getLinkUrl('Request_Confirm.html');

}

if ((GetCheckState('u24')) == (true)) {

SetGlobalVariableValue('Size', 'Small');

}
else
if ((GetCheckState('u26')) == (true)) {

SetGlobalVariableValue('Size', 'Medium');

}
else
if ((GetCheckState('u28')) == (true)) {

SetGlobalVariableValue('Size', 'Large');

}
});
gv_vAlignTable['u25'] = 'top';gv_vAlignTable['u46'] = 'center';gv_vAlignTable['u53'] = 'top';gv_vAlignTable['u54'] = 'top';gv_vAlignTable['u19'] = 'top';gv_vAlignTable['u55'] = 'top';gv_vAlignTable['u20'] = 'top';gv_vAlignTable['u22'] = 'top';gv_vAlignTable['u49'] = 'top';gv_vAlignTable['u47'] = 'top';
$axure.eventManager.change('u51', function(e) {

if ((GetSelectedOption('u51')) == ('Project 1')) {

SetGlobalVariableValue('Proj1PM', 'Tom Roloff');

SetGlobalVariableValue('Proj1PA', 'Tony Heard');

SetWidgetRichText('u54', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj1PM')) + '</span></p>');

SetWidgetRichText('u55', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj1PA')) + '</span></p>');

}
else
if ((GetSelectedOption('u51')) == ('Project 2')) {

SetGlobalVariableValue('Proj2PM', 'Martin Richards');

SetGlobalVariableValue('Proj2PA', 'Jeremy Burton');

SetWidgetRichText('u54', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj2PM')) + '</span></p>');

SetWidgetRichText('u55', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj2PA')) + '</span></p>');

}
else
if ((GetSelectedOption('u51')) == ('Project 3')) {

SetGlobalVariableValue('Proj3PM', 'Frank Hauck');

SetGlobalVariableValue('Proj3PA', 'Jon Pierce');

SetWidgetRichText('u54', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj3PM')) + '</span></p>');

SetWidgetRichText('u55', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj3PA')) + '</span></p>');

}
else
if ((GetSelectedOption('u51')) == ('Project 4')) {

SetGlobalVariableValue('Proj4PM', 'Erik Brooke');

SetGlobalVariableValue('Proj5PA', 'Tom Roloff');

SetWidgetRichText('u54', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj4PM')) + '</span></p>');

SetWidgetRichText('u55', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj5PA')) + '</span></p>');

}
else
if ((GetSelectedOption('u51')) == ('Project 6')) {

SetGlobalVariableValue('Proj6PM', 'Tony Heard');

SetGlobalVariableValue('Proj6PA', 'Frank Hauck');

SetWidgetRichText('u54', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj6PM')) + '</span></p>');

SetWidgetRichText('u55', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Proj6PA')) + '</span></p>');

}
});
gv_vAlignTable['u52'] = 'top';gv_vAlignTable['u34'] = 'top';