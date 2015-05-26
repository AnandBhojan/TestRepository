for(var i = 0; i < 51; i++) { var scriptId = 'u' + i; window[scriptId] = document.getElementById(scriptId); }

$axure.eventManager.pageLoad(
function (e) {

if (true) {

SetWidgetRichText('u44', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('projname')) + '</span></p>');

SetWidgetRichText('u32', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('SeedFile')) + '</span></p>');

SetWidgetRichText('u49', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('NoVDI')) + '</span></p>');

SetWidgetRichText('u46', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Intergraph')) + '</span></p>');

SetWidgetRichText('u31', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('VDIAdmin')) + '</span></p>');

SetWidgetRichText('u27', '<p style="text-align:left;"><span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">' + (GetGlobalVariableValue('Size')) + '</span></p>');

}

});
gv_vAlignTable['u31'] = 'top';
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
gv_vAlignTable['u28'] = 'top';gv_vAlignTable['u29'] = 'top';gv_vAlignTable['u8'] = 'center';gv_vAlignTable['u30'] = 'top';gv_vAlignTable['u21'] = 'top';gv_vAlignTable['u6'] = 'center';gv_vAlignTable['u32'] = 'top';
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
gv_vAlignTable['u38'] = 'top';u43.tabIndex = 0;

u43.style.cursor = 'pointer';
$axure.eventManager.click('u43', function(e) {

if (true) {

	self.location.href="javascript:history.back()";

}
});
gv_vAlignTable['u43'] = 'top';gv_vAlignTable['u44'] = 'top';gv_vAlignTable['u40'] = 'top';gv_vAlignTable['u1'] = 'center';gv_vAlignTable['u37'] = 'top';gv_vAlignTable['u26'] = 'top';gv_vAlignTable['u10'] = 'top';gv_vAlignTable['u11'] = 'top';gv_vAlignTable['u3'] = 'center';gv_vAlignTable['u12'] = 'top';u9.tabIndex = 0;

u9.style.cursor = 'pointer';
$axure.eventManager.click('u9', function(e) {

if (true) {

	self.location.href=$axure.globalVariableProvider.getLinkUrl('Request.html');

}
});
gv_vAlignTable['u9'] = 'top';gv_vAlignTable['u27'] = 'top';gv_vAlignTable['u42'] = 'center';
u23.style.cursor = 'pointer';
$axure.eventManager.click('u23', function(e) {

if (true) {

	self.location.href=$axure.globalVariableProvider.getLinkUrl('My_Cart.html');

}
});
gv_vAlignTable['u24'] = 'top';gv_vAlignTable['u25'] = 'top';gv_vAlignTable['u46'] = 'top';gv_vAlignTable['u19'] = 'top';gv_vAlignTable['u20'] = 'top';gv_vAlignTable['u48'] = 'top';gv_vAlignTable['u22'] = 'top';gv_vAlignTable['u49'] = 'top';gv_vAlignTable['u45'] = 'top';