-- 2017-05-27T13:00:47.224
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu (Action,AD_Client_ID,AD_Menu_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,Description,EntityType,InternalName,IsActive,IsCreateNew,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy,WEBUI_NameBrowse) VALUES ('W',0,540842,0,137,TO_TIMESTAMP('2017-05-27 13:00:47','YYYY-MM-DD HH24:MI:SS'),100,'Steuern und Steuersätze verwalten','D','_Steuersatz','Y','N','N','N','N','Steuersatz',TO_TIMESTAMP('2017-05-27 13:00:47','YYYY-MM-DD HH24:MI:SS'),100,'Steuersatz')
;

-- 2017-05-27T13:00:47.235
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=540842 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 2017-05-27T13:00:47.238
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT  INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID,0, 'Y', now(), 100, now(), 100,t.AD_Tree_ID, 540842, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.AD_Table_ID=116 AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=540842)
;

-- 2017-05-27T13:00:47.339
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000079, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540842 AND AD_Tree_ID=10
;

-- 2017-05-27T13:00:54.400
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540842 AND AD_Tree_ID=10
;

-- 2017-05-27T13:00:54.402
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540810 AND AD_Tree_ID=10
;

-- 2017-05-27T13:00:54.403
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540812 AND AD_Tree_ID=10
;

-- 2017-05-27T13:00:54.403
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540813 AND AD_Tree_ID=10
;

-- 2017-05-27T13:00:54.404
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540780 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.129
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu (Action,AD_Client_ID,AD_Menu_ID,AD_Org_ID,AD_Window_ID,Created,CreatedBy,Description,EntityType,InternalName,IsActive,IsCreateNew,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy,WEBUI_NameBrowse) VALUES ('W',0,540843,0,138,TO_TIMESTAMP('2017-05-27 13:01:40','YYYY-MM-DD HH24:MI:SS'),100,'Steuerkategorien verwalten','D','_Steuerkategorie','Y','N','N','N','N','Steuerkategorie',TO_TIMESTAMP('2017-05-27 13:01:40','YYYY-MM-DD HH24:MI:SS'),100,'Steuer Kategorie')
;

-- 2017-05-27T13:01:40.133
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name,WEBUI_NameBrowse,WEBUI_NameNew,WEBUI_NameNewBreadcrumb, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name,t.WEBUI_NameBrowse,t.WEBUI_NameNew,t.WEBUI_NameNewBreadcrumb, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=540843 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 2017-05-27T13:01:40.137
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT  INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID,0, 'Y', now(), 100, now(), 100,t.AD_Tree_ID, 540843, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.AD_Table_ID=116 AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=540843)
;

-- 2017-05-27T13:01:40.722
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=265 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.725
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=104 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.727
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=105 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.728
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=384 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.730
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=111 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.732
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=106 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.733
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=6, Updated=now(), UpdatedBy=100 WHERE  Node_ID=117 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.734
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=7, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540675 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.736
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=8, Updated=now(), UpdatedBy=100 WHERE  Node_ID=418 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.739
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=9, Updated=now(), UpdatedBy=100 WHERE  Node_ID=102 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.740
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=10, Updated=now(), UpdatedBy=100 WHERE  Node_ID=103 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.741
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=11, Updated=now(), UpdatedBy=100 WHERE  Node_ID=270 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.742
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=12, Updated=now(), UpdatedBy=100 WHERE  Node_ID=121 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.743
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=13, Updated=now(), UpdatedBy=100 WHERE  Node_ID=476 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.744
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=14, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540715 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.745
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=15, Updated=now(), UpdatedBy=100 WHERE  Node_ID=409 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.745
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=16, Updated=now(), UpdatedBy=100 WHERE  Node_ID=151 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.746
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=17, Updated=now(), UpdatedBy=100 WHERE  Node_ID=53087 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.747
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=18, Updated=now(), UpdatedBy=100 WHERE  Node_ID=464 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.747
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=19, Updated=now(), UpdatedBy=100 WHERE  Node_ID=124 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.748
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=20, Updated=now(), UpdatedBy=100 WHERE  Node_ID=123 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.749
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=21, Updated=now(), UpdatedBy=100 WHERE  Node_ID=547 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.750
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=22, Updated=now(), UpdatedBy=100 WHERE  Node_ID=53189 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.751
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=23, Updated=now(), UpdatedBy=100 WHERE  Node_ID=174 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.751
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=24, Updated=now(), UpdatedBy=100 WHERE  Node_ID=254 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.752
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=25, Updated=now(), UpdatedBy=100 WHERE  Node_ID=120 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.752
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=26, Updated=now(), UpdatedBy=100 WHERE  Node_ID=135 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.753
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=27, Updated=now(), UpdatedBy=100 WHERE  Node_ID=550 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.754
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=28, Updated=now(), UpdatedBy=100 WHERE  Node_ID=551 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.754
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=29, Updated=now(), UpdatedBy=100 WHERE  Node_ID=306 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.755
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=30, Updated=now(), UpdatedBy=100 WHERE  Node_ID=53091 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.755
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=31, Updated=now(), UpdatedBy=100 WHERE  Node_ID=417 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.756
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=32, Updated=now(), UpdatedBy=100 WHERE  Node_ID=307 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.756
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=33, Updated=now(), UpdatedBy=100 WHERE  Node_ID=393 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.757
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=34, Updated=now(), UpdatedBy=100 WHERE  Node_ID=53248 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:40.758
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=164, SeqNo=35, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540843 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.913
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=0, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540842 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.915
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=1, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540843 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.915
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=2, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540810 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.916
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=3, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540812 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.916
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=4, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540813 AND AD_Tree_ID=10
;

-- 2017-05-27T13:01:55.916
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
UPDATE AD_TreeNodeMM SET Parent_ID=1000072, SeqNo=5, Updated=now(), UpdatedBy=100 WHERE  Node_ID=540780 AND AD_Tree_ID=10
;

-- 2017-05-27T13:13:51.168
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy,Value) VALUES (0,0,174,540221,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'main')
;

-- 2017-05-27T13:13:51.169
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section_Trl (AD_Language,AD_UI_Section_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_UI_Section_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_UI_Section t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_UI_Section_ID=540221 AND NOT EXISTS (SELECT * FROM AD_UI_Section_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_UI_Section_ID=t.AD_UI_Section_ID)
;

-- 2017-05-27T13:13:51.201
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Column (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy) VALUES (0,0,540305,540221,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.232
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Column (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy) VALUES (0,0,540306,540221,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Y',20,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.276
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,UIStyle,Updated,UpdatedBy) VALUES (0,0,540305,540515,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Y','default',10,'primary',TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.317
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,968,0,174,540515,544863,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Mandant für diese Installation.','Ein Mandant ist eine Firma oder eine juristische Person. Sie können keine Daten über Mandanten hinweg verwenden. .','Y','N','Y','N','N','Mandant',10,0,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.348
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2040,0,174,540515,544864,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Organisatorische Einheit des Mandanten','Eine Organisation ist ein Bereich ihres Mandanten - z.B. Laden oder Abteilung. Sie können Daten über Organisationen hinweg gemeinsam verwenden.','Y','N','Y','N','N','Sektion',20,0,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.377
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,970,0,174,540515,544865,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Alphanumeric identifier of the entity','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','Y','N','Y','Y','N','Name',30,10,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.407
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,971,0,174,540515,544866,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Y','N','Y','N','N','Beschreibung',40,0,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.448
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,969,0,174,540515,544867,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Der Eintrag ist im System aktiv','Es gibt zwei Möglichkeiten, einen Datensatz nicht mehr verfügbar zu machen: einer ist, ihn zu löschen; der andere, ihn zu deaktivieren. Ein deaktivierter Eintrag ist nicht mehr für eine Auswahl verfügbar, aber verfügbar für die Verwendung in Berichten. Es gibt zwei Gründe, Datensätze zu deaktivieren und nicht zu löschen: (1) Das System braucht den Datensatz für Revisionszwecke. (2) Der Datensatz wird von anderen Datensätzen referenziert. Z.B. können Sie keinen Geschäftspartner löschen, wenn es Rechnungen für diesen Geschäftspartner gibt. Sie deaktivieren den Geschäftspartner und verhindern, dass dieser Eintrag in zukünftigen Vorgängen verwendet wird.','Y','N','Y','Y','N','Aktiv',50,20,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.484
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,3145,0,174,540515,544868,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Default value','The Default Checkbox indicates if this record will be used as a default value.','Y','N','Y','Y','N','Standard',60,30,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.514
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,978,0,174,540515,544869,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Steuerkategorie','Die Steuerkategorie hilft, ähnliche Steuern zu gruppieren. Z.B. Verkaufssteuer oder Mehrwertsteuer.
','Y','N','Y','Y','N','Steuerkategorie',70,40,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.544
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2093,0,174,540515,544870,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Gültig ab inklusiv (erster Tag)','"Gültig ab" bezeichnet den ersten Tag eines Gültigkeitzeitraumes.','Y','N','Y','Y','N','Gültig ab',80,50,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.577
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6121,0,174,540515,544871,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Steuersatz steuerbefreit','If a business partner is exempt from tax on sales, the exempt tax rate is used. For this, you need to set up a tax rate with a 0% rate and indicate that this is your tax exempt rate.  This is required for tax reporting, so that you can track tax exempt transactions.','Y','N','Y','Y','N','steuerbefreit',90,60,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.615
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2872,0,174,540515,544872,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Dieser Steuersatz erfordert eine Steuer-ID beim Geschäftspartner,.','The Requires Tax Certificate indicates that a tax certificate is required for a Business Partner to be tax exempt.','Y','N','Y','Y','N','erfordert Steuer-ID',100,70,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.649
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2091,0,174,540515,544873,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Steuer wird dokumentbasiert berechnet (abweichend wäre zeilenweise)','If the tax is calculated on document level, all lines with that tax rate are added before calculating the total tax for the document.
Otherwise the tax is calculated per line and then added.
Due to rounding, the tax amount can differ.','Y','N','Y','Y','N','Dokumentbasiert',110,80,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.684
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,12489,0,174,540515,544874,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Dies ist eine VK Steuer','If selected AP tax is handled as expense, otherwise it is handeled as a VAT credit.','Y','N','Y','Y','N','VK Steuer',120,90,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.719
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,74290,0,174,540515,544875,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'If this flag is set, in a tax aware document (e.g. Invoice, Order) this tax will absorb the whole amount, leaving 0 for base amount','If this flag is set, in a tax aware document (e.g. Invoice, Order) this tax will absorb the whole amount, leaving 0 for base amount.

Using this feature is useful when you have to create invoices/orders that contain only taxes on a line (e.g. custom authorities invoices).','Y','N','Y','N','N','Whole Tax',130,0,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.766
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2092,0,174,540515,544876,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Dies ist ein Zusammenfassungseintrag','A summary entity represents a branch in a tree rather than an end-node. Summary entities are used for reporting and do not have own values.','Y','N','Y','N','N','Zusammenfassungseintrag',140,0,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:51.795
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,973,0,174,540515,544877,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Setzt sich die Steuer aus mehreren Steuersätzen zusammen, wird dies mit übergeordneten Steuersätzen definiert.','The Parent Tax indicates a tax that is a reference for multiple taxes.  This allows you to charge multiple taxes on a document by entering the Parent Tax','Y','N','Y','Y','N','Übergeordnete Steuer',150,100,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.080
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,8195,0,174,540515,544878,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100,'Steuer für Einkauf und/ oder Verkauf Transaktionen.','Sales Tax: charged when selling - examples: Sales Tax, Output VAT (payable)
Purchase Tax: tax charged when purchasing - examples: Use Tax, Input VAT (receivable)','Y','N','Y','Y','N','VK/ EK Typ',160,110,0,TO_TIMESTAMP('2017-05-27 13:13:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.110
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,3076,0,174,540515,544879,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Kurze Bezeichnung der Steuer zum Druck auf Dokumenten.','"Steuer-Indikato" zeigt die kurze Bezeichnung der Steuer die auf Dokumenten mit Bezug zu dieser Steuer gedruckt wird.','Y','N','Y','Y','N','Steuer-Indikator',170,120,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.138
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,2871,0,174,540515,544880,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Rate or Tax or Exchange','The Rate indicates the percentage to be multiplied by the source to arrive at the tax or exchange amount.','Y','N','Y','Y','N','Satz',180,130,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.168
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,54440,0,174,540515,544881,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y','N','Y','Y','N','Regel',190,140,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.202
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,974,0,174,540515,544882,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Land','"Land" bezeichnet ein Land. Jedes Land muss angelegt sein, bevor es in einem Beleg verwendet werden kann.','Y','N','Y','Y','N','Land',200,150,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.233
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,976,0,174,540515,544883,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Receiving Country','The To Country indicates the receiving country on a document','Y','N','Y','Y','N','An',210,160,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.259
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,975,0,174,540515,544884,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Identifiziert eine geographische Region','"Region" bezeichnet eine Region oder einen Bundesstaat in diesem Land.','Y','N','Y','N','N','Region',220,0,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.286
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,977,0,174,540515,544885,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Receiving Region','The To Region indicates the receiving region on a document','Y','N','Y','N','N','An',230,0,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.312
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,56409,0,174,540515,544886,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Starte das kopieren des Steuersatzes','Button to start the tax duplication process.','Y','N','Y','Y','N','Steuer kopieren',240,170,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.338
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,56447,0,174,540515,544887,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Das Zielland befindet sich in der EU','The destination location is inside the European Union.','Y','N','Y','Y','N','Nach EU',250,180,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.363
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy,Value) VALUES (0,0,640,540222,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'main')
;

-- 2017-05-27T13:13:52.363
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section_Trl (AD_Language,AD_UI_Section_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_UI_Section_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_UI_Section t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_UI_Section_ID=540222 AND NOT EXISTS (SELECT * FROM AD_UI_Section_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_UI_Section_ID=t.AD_UI_Section_ID)
;

-- 2017-05-27T13:13:52.388
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Column (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy) VALUES (0,0,540307,540222,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.412
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,UIStyle,Updated,UpdatedBy) VALUES (0,0,540307,540516,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y','default',10,'primary',TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.441
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10061,0,640,540516,544888,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Mandant für diese Installation.','Ein Mandant ist eine Firma oder eine juristische Person. Sie können keine Daten über Mandanten hinweg verwenden. .','Y','N','N','Y','N','Mandant',0,10,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.470
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10064,0,640,540516,544889,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Organisatorische Einheit des Mandanten','Eine Organisation ist ein Bereich ihres Mandanten - z.B. Laden oder Abteilung. Sie können Daten über Organisationen hinweg gemeinsam verwenden.','Y','N','N','Y','N','Sektion',0,20,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.503
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10066,0,640,540516,544890,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Steuerart','Steuer bezeichnet die in dieser Dokumentenzeile verwendete Steuerart.','Y','N','N','Y','N','Steuer',0,30,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.539
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10063,0,640,540516,544891,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Der Eintrag ist im System aktiv','Es gibt zwei Möglichkeiten, einen Datensatz nicht mehr verfügbar zu machen: einer ist, ihn zu löschen; der andere, ihn zu deaktivieren. Ein deaktivierter Eintrag ist nicht mehr für eine Auswahl verfügbar, aber verfügbar für die Verwendung in Berichten. Es gibt zwei Gründe, Datensätze zu deaktivieren und nicht zu löschen: (1) Das System braucht den Datensatz für Revisionszwecke. (2) Der Datensatz wird von anderen Datensätzen referenziert. Z.B. können Sie keinen Geschäftspartner löschen, wenn es Rechnungen für diesen Geschäftspartner gibt. Sie deaktivieren den Geschäftspartner und verhindern, dass dieser Eintrag in zukünftigen Vorgängen verwendet wird.','Y','N','N','Y','N','Aktiv',0,40,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.573
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10067,0,640,540516,544892,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Postleitzahl','"PLZ" bezeichnet die Postleitzahl für diese Adresse oder dieses Postfach.','Y','N','N','Y','N','PLZ',0,50,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.606
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,10065,0,640,540516,544893,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Postal code to','Conecutive range to','Y','N','N','Y','N','ZIP To',0,60,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.640
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy,Value) VALUES (0,0,458,540223,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'main')
;

-- 2017-05-27T13:13:52.641
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section_Trl (AD_Language,AD_UI_Section_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_UI_Section_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_UI_Section t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_UI_Section_ID=540223 AND NOT EXISTS (SELECT * FROM AD_UI_Section_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_UI_Section_ID=t.AD_UI_Section_ID)
;

-- 2017-05-27T13:13:52.675
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Column (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy) VALUES (0,0,540308,540223,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.705
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,UIStyle,Updated,UpdatedBy) VALUES (0,0,540308,540517,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y','default',10,'primary',TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.742
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6280,0,458,540517,544894,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Mandant für diese Installation.','Ein Mandant ist eine Firma oder eine juristische Person. Sie können keine Daten über Mandanten hinweg verwenden. .','Y','N','N','Y','N','Mandant',0,10,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.774
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6283,0,458,540517,544895,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Organisatorische Einheit des Mandanten','Eine Organisation ist ein Bereich ihres Mandanten - z.B. Laden oder Abteilung. Sie können Daten über Organisationen hinweg gemeinsam verwenden.','Y','N','N','Y','N','Sektion',0,20,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.807
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6276,0,458,540517,544896,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Steuerart','Steuer bezeichnet die in dieser Dokumentenzeile verwendete Steuerart.','Y','N','N','Y','N','Steuer',0,30,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.841
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6277,0,458,540517,544897,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Sprache für diesen Eintrag','Definiert die Sprache für Anzeige und Aufbereitung','Y','N','N','Y','N','Sprache',0,40,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.875
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6281,0,458,540517,544898,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Der Eintrag ist im System aktiv','Es gibt zwei Möglichkeiten, einen Datensatz nicht mehr verfügbar zu machen: einer ist, ihn zu löschen; der andere, ihn zu deaktivieren. Ein deaktivierter Eintrag ist nicht mehr für eine Auswahl verfügbar, aber verfügbar für die Verwendung in Berichten. Es gibt zwei Gründe, Datensätze zu deaktivieren und nicht zu löschen: (1) Das System braucht den Datensatz für Revisionszwecke. (2) Der Datensatz wird von anderen Datensätzen referenziert. Z.B. können Sie keinen Geschäftspartner löschen, wenn es Rechnungen für diesen Geschäftspartner gibt. Sie deaktivieren den Geschäftspartner und verhindern, dass dieser Eintrag in zukünftigen Vorgängen verwendet wird.','Y','N','N','Y','N','Aktiv',0,50,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.907
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6279,0,458,540517,544899,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Diese Spalte ist übersetzt','Das Selektionsfeld "Übersetzt" zeigt an, dass diese Spalte übersetzt ist','Y','N','N','Y','N','Übersetzt',0,60,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.947
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6282,0,458,540517,544900,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Alphanumeric identifier of the entity','The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.','Y','N','N','Y','N','Name',0,70,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:52.973
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6278,0,458,540517,544901,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Y','N','N','Y','N','Beschreibung',0,80,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.005
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,6275,0,458,540517,544902,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100,'Kurze Bezeichnung der Steuer zum Druck auf Dokumenten.','"Steuer-Indikato" zeigt die kurze Bezeichnung der Steuer die auf Dokumenten mit Bezug zu dieser Steuer gedruckt wird.','Y','N','N','Y','N','Steuer-Indikator',0,90,0,TO_TIMESTAMP('2017-05-27 13:13:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.043
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section (AD_Client_ID,AD_Org_ID,AD_Tab_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy,Value) VALUES (0,0,333,540224,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'main')
;

-- 2017-05-27T13:13:53.045
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Section_Trl (AD_Language,AD_UI_Section_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_UI_Section_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_UI_Section t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_UI_Section_ID=540224 AND NOT EXISTS (SELECT * FROM AD_UI_Section_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_UI_Section_ID=t.AD_UI_Section_ID)
;

-- 2017-05-27T13:13:53.076
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Column (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_Section_ID,Created,CreatedBy,IsActive,SeqNo,Updated,UpdatedBy) VALUES (0,0,540309,540224,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Y',10,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.102
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_ElementGroup (AD_Client_ID,AD_Org_ID,AD_UI_Column_ID,AD_UI_ElementGroup_ID,Created,CreatedBy,IsActive,Name,SeqNo,UIStyle,Updated,UpdatedBy) VALUES (0,0,540309,540518,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Y','default',10,'primary',TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.133
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4073,0,333,540518,544903,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Mandant für diese Installation.','Ein Mandant ist eine Firma oder eine juristische Person. Sie können keine Daten über Mandanten hinweg verwenden. .','Y','N','N','Y','N','Mandant',0,10,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.163
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4074,0,333,540518,544904,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Organisatorische Einheit des Mandanten','Eine Organisation ist ein Bereich ihres Mandanten - z.B. Laden oder Abteilung. Sie können Daten über Organisationen hinweg gemeinsam verwenden.','Y','N','N','Y','N','Sektion',0,20,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.197
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4076,0,333,540518,544905,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Steuerart','Steuer bezeichnet die in dieser Dokumentenzeile verwendete Steuerart.','Y','N','N','Y','N','Steuer',0,30,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.233
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4075,0,333,540518,544906,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Stammdaten für Buchhaltung','Ein Kontenschema definiert eine Ausprägung von Stammdaten für die Buchhaltung wie verwendete Art der Kostenrechnung, Währung und Buchungsperiode.','Y','N','N','Y','N','Buchführungs-Schema',0,40,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.267
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4077,0,333,540518,544907,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Der Eintrag ist im System aktiv','Es gibt zwei Möglichkeiten, einen Datensatz nicht mehr verfügbar zu machen: einer ist, ihn zu löschen; der andere, ihn zu deaktivieren. Ein deaktivierter Eintrag ist nicht mehr für eine Auswahl verfügbar, aber verfügbar für die Verwendung in Berichten. Es gibt zwei Gründe, Datensätze zu deaktivieren und nicht zu löschen: (1) Das System braucht den Datensatz für Revisionszwecke. (2) Der Datensatz wird von anderen Datensätzen referenziert. Z.B. können Sie keinen Geschäftspartner löschen, wenn es Rechnungen für diesen Geschäftspartner gibt. Sie deaktivieren den Geschäftspartner und verhindern, dass dieser Eintrag in zukünftigen Vorgängen verwendet wird.','Y','N','N','Y','N','Aktiv',0,50,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.302
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4079,0,333,540518,544908,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Konto für geschuldete MwSt.','"Fällige Steuer" zeigt das Konto an, auf dem die zu zahlenden Steuern gesammelt werden.','Y','N','N','Y','N','Geschuldete MwSt.',0,60,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.336
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4081,0,333,540518,544909,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Konto für Verbindlichkeiten aus Steuern','The Tax Liability Account indicates the account used to record your tax liability declaration.','Y','N','N','Y','N','Verbindlichkeiten aus Steuern',0,70,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.370
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4078,0,333,540518,544910,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Konto für Vorsteuer','The Tax Credit Account indicates the account used to record taxes that can be reclaimed','Y','N','N','Y','N','Vorsteuer',0,80,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.403
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4082,0,333,540518,544911,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Konto für Steuerüberzahlungen','The Tax Receivables Account indicates the account used to record the tax credit amount after your tax declaration.','Y','N','N','Y','N','Steuerüberzahlungen',0,90,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.436
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,4080,0,333,540518,544912,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Account for paid tax you cannot reclaim','The Tax Expense Account indicates the account used to record the taxes that have been paid that cannot be reclaimed.','Y','N','N','Y','N','Sonstige Steuern',0,100,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.466
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,56406,0,333,540518,544913,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Steuerabhängiges Konto zur Verbuchung gewährter Skonti','Tax dependent account - used for early payment discount (on sales) if this tax is applied.','Y','N','N','Y','N','Steuerkorrektur gewährte Skonti',0,110,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.500
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,56408,0,333,540518,544914,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Steuerabhängiges Konto zur Verbuchung Erlöse','Tax dependent account - used for revenue if this tax is applied. ','Y','N','N','Y','N','Erlös Konto',0,120,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 2017-05-27T13:13:53.535
-- I forgot to set the DICTIONARY_ID_COMMENTS System Configurator
INSERT INTO AD_UI_Element (AD_Client_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,AD_UI_ElementGroup_ID,AD_UI_Element_ID,Created,CreatedBy,Description,Help,IsActive,IsAdvancedField,IsDisplayed,IsDisplayedGrid,IsDisplayed_SideList,Name,SeqNo,SeqNoGrid,SeqNo_SideList,Updated,UpdatedBy) VALUES (0,56407,0,333,540518,544915,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100,'Steuerabhängiges Konto zur Verbuchung erhaltener Skonti','Tax dependent account - used for earned early payment discount (on purchases) if this tax is applied.','Y','N','N','Y','N','Steuerkorrektur erhaltene Skonti',0,130,0,TO_TIMESTAMP('2017-05-27 13:13:53','YYYY-MM-DD HH24:MI:SS'),100)
;

